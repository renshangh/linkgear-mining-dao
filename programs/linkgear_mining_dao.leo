// Linkgear Mining DAO governance and rewards
program mining_dao.aleo {

    // tALEO token record - Community Token Creator, Staker, Investor
    record TALEO {
        owner: address,
        amount: u64,
    }

    // Proposal details with rig info - Governance Participant
    struct ProposalInfo {
        title: field,           // e.g., "Add Doge Rig"
        content: field,         // Description
        proposer: address,      // DAO admin/staker
        deadline: u64,          // Voting deadline
        type: u8,               // 0=rig_provider, 1=fund, 2=reward, 3=crypto
        rig_mach: RigMachine,   // Physical machine details
    }

    // Physical machine info for ROI - Staker, Governance Participant
    struct RigMachine {
        power: u64,             // Hash rate (e.g., TH/s)
        cost_per_day: u64,      // Daily cost estimate (tALEO)
        exp_coins_3yr: u64,     // Expected coins over 3 years
        break_even_days: u32,   // Break-even point in days
        coin: u8,               // 0=BTC, 1=Doge, 2=ALEO, 3=ALPH
    }

    // Proposal record - Governance Participant
    record Proposal {
        owner: address,
        id: field,
        info: ProposalInfo,
    }

    // Rig provider registration - Rig Provider (formerly Miner)
    record RigProviderTkt {
        owner: address,
        rid: field,             // Rig provider ID
        power: u64,             // Total hash rate
        cost_per_day: u64,      // Daily operational cost
        coin: u8,               // Supported coin
    }

    // Public mappings
    mapping props: field => ProposalInfo;     // Proposals with rig info
    mapping stakes: address => u64;           // Staked tALEO - Staker
    mapping rig_provs: field => u64;          // Rig provider hash rates - Rig Provider
    mapping tickets: field => u64;            // Tickets per proposal
    mapping agrees: field => u64;             // Agree votes
    mapping disagrees: field => u64;          // Disagree votes
    mapping rewards: u8 => u64;               // Rewards per coin - Rig Provider, Staker
    mapping treasury: address => u64;         // Treasury funds - Infra Provider

    // Community Token Creator: Init tALEO
    async transition init_token(pub supply: u64) -> (TALEO, Future) {
        assert_eq(self.caller, aleo1dao_admin); // Replace with admin address
        return (TALEO { owner: self.caller, amount: supply }, fin_init_token(supply));
    }

    async function fin_init_token(pub supply: u64) {
        Mapping::set(treasury, aleo1dao_admin, supply);
    }

    // Staker: Stake tALEO
    async transition stake(taleo: TALEO, pub amt: u64) -> (TALEO, Future) {
        assert_eq(self.caller, taleo.owner);
        assert(taleo.amount >= amt, "Low tALEO");
        let rem: TALEO = TALEO { owner: self.caller, amount: taleo.amount - amt };
        return (rem, fin_stake(self.caller, amt));
    }

    async function fin_stake(pub staker: address, pub amt: u64) {
        let curr: u64 = Mapping::get_or_use(stakes, staker, 0u64);
        Mapping::set(stakes, staker, curr + amt);
    }

    // Governance Participant: Propose with rig machine info
    async transition propose(pub info: ProposalInfo) -> (Proposal, Future) {
        assert_eq(self.caller, info.proposer);
        let staked: u64 = Mapping::get_or_use(stakes, self.caller, 0u64);
        assert(staked > 0u64, "Stake required");
        let id: field = BHP256::hash_to_field(info.title);
        return (Proposal { owner: self.caller, id, info }, fin_propose(id));
    }

    async function fin_propose(pub id: field) {
        Mapping::set(tickets, id, 0u64);
        Mapping::set(props, id, ProposalInfo); // Includes rig_mach
    }

    // Rig Provider: Register with cost estimate
    async transition reg_rig_prov(pub pwr: u64, pub cost: u64, pub coin: u8) -> (RigProviderTkt, Future) {
        let rid: field = BHP256::hash_to_field(self.caller as field);
        return (RigProviderTkt { owner: self.caller, rid, power: pwr, cost_per_day: cost, coin }, fin_reg_rig_prov(rid, pwr));
    }

    async function fin_reg_rig_prov(pub rid: field, pub pwr: u64) {
        let curr: u64 = Mapping::get_or_use(rig_provs, rid, 0u64);
        Mapping::set(rig_provs, rid, curr + pwr);
    }

    // Governance Participant: Issue ticket
    async transition new_ticket(pub pid: field, pub voter: address) -> (Ticket, Future) {
        let staked: u64 = Mapping::get_or_use(stakes, voter, 0u64);
        assert(staked > 0u64, "Stake to vote");
        return (Ticket { owner: voter, pid }, fin_new_ticket(pid));
    }

    async function fin_new_ticket(pub pid: field) {
        let curr: u64 = Mapping::get_or_use(tickets, pid, 0u64);
        Mapping::set(tickets, pid, curr + 1u64);
    }

    // Governance Participant: Vote agree
    async transition agree(ticket: Ticket) -> Future {
        let staked: u64 = Mapping::get_or_use(stakes, ticket.owner, 0u64);
        assert(staked > 0u64, "Stake required");
        return fin_agree(ticket.pid, staked);
    }

    async function fin_agree(pub pid: field, pub amt: u64) {
        let curr: u64 = Mapping::get_or_use(agrees, pid, 0u64);
        Mapping::set(agrees, pid, curr + amt);
    }

    // Governance Participant: Vote disagree
    async transition disagree(ticket: Ticket) -> Future {
        let staked: u64 = Mapping::get_or_use(stakes, ticket.owner, 0u64);
        assert(staked > 0u64, "Stake required");
        return fin_disagree(ticket.pid, staked);
    }

    async function fin_disagree(pub pid: field, pub amt: u64) {
        let curr: u64 = Mapping::get_or_use(disagrees, pid, 0u64);
        Mapping::set(disagrees, pid, curr + amt);
    }

    // Community Token Creator: Distribute rewards
    async transition distrib_rewards(pub coin: u8, pub total: u64) -> Future {
        assert_eq(self.caller, aleo1dao_admin);
        return fin_distrib_rewards(coin, total);
    }

    async function fin_distrib_rewards(pub coin: u8, pub total: u64) {
        let curr: u64 = Mapping::get_or_use(rewards, coin, 0u64);
        Mapping::set(rewards, coin, curr + total);
    }

    // Getters
    function get_prop_info(pid: field) -> ProposalInfo {
        return props[pid];
    }

    function get_tickets(pid: field) -> u64 {
        return tickets[pid];
    }

    function get_agree_votes(pid: field) -> u64 {
        return agrees[pid];
    }

    function get_dis_votes(pid: field) -> u64 {
        return disagrees[pid];
    }

    function get_stake_amt(addr: address) -> u64 {
        return stakes[addr];
    }

    function get_rig_pwr(rid: field) -> u64 {
        return rig_provs[rid];
    }

    function get_rewards(coin: u8) -> u64 {
        return rewards[coin];
    }
}