// The 'linkgear_mining_dao' program.
program mining_dao.aleo {

    // Define the governance token tALEO
    struct tALEO {
        balance: u64,
    }

    // Structure for a registered miner
    struct Miner {
        address: address,
        hash_rate: u64,
        approved: bool,
        rewards: u64,
    }

    // Mapping of registered miners
    mapping miners: address -> Miner;

    // Structure for staking
    struct Stake {
        staker: address,
        amount: u64,
        timestamp: u64,
    }

    // Mapping for staked tokens
    mapping stakes: address -> Stake;

    // Governance Voting
    mapping votes: u64 -> (address, bool);

    // Mapping for proposals
    mapping proposals: u64 -> (string, address, u64, bool);

    // Function to issue new tALEO tokens
    function issue_tALEO(
        recipient: address,
        amount: u64
    ) -> bool {
        tALEO.mint(recipient, amount);
        return true;
    }

    // Function to register a miner
    function register_miner(
        miner_address: address,
        hash_rate: u64
    ) -> bool {
        miners[miner_address] = Miner { miner_address, hash_rate, false, 0 };
        return true;
    }

    // Function to vote for a miner
    function vote_for_miner(
        voter: address,
        miner_address: address,
        approve: bool
    ) -> bool {
        ensure stakes.contains(voter);
        miners[miner_address].approved = approve;
        return true;
    }

    // Function to stake tokens
    function stake(
        staker: address,
        amount: u64
    ) -> bool {
        ensure tALEO.balance_of(staker) >= amount;
        stakes[staker] = Stake { staker, amount, now() };
        return true;
    }

    // Function to distribute mining rewards
    function distribute_rewards(
        miner_address: address,
        reward_amount: u64
    ) -> bool {
        ensure miners[miner_address].approved;
        miners[miner_address].rewards += reward_amount;
        tALEO.mint(miner_address, reward_amount);
        return true;
    }

    // Function to withdraw staked tokens
    function withdraw_stake(
        staker: address
    ) -> bool {
        ensure stakes.contains(staker);
        tALEO.transfer(staker, stakes[staker].amount);
        stakes.remove(staker);
        return true;
    }

    // Function for governance fund allocation
    function allocate_funds(
        recipient: address,
        amount: u64
    ) -> bool {
        ensure stakes.contains(recipient);
        tALEO.mint(recipient, amount);
        return true;
    }

    // Function to add a new mining coin support
    function add_mining_coin(
        coin_name: string
    ) -> bool {
        // Governance vote required
        return true;
    }

    // Function to create a proposal
    function create_proposal(
        proposal_id: u64,
        description: string,
        target: address,
        amount: u64
    ) -> bool {
        proposals[proposal_id] = (description, target, amount, false);
        return true;
    }

    // Function to vote on a proposal
    function vote_on_proposal(
        voter: address,
        proposal_id: u64,
        approve: bool
    ) -> bool {
        ensure stakes.contains(voter);
        votes[proposal_id] = (voter, approve);
        return true;
    }

    // Function to execute an approved proposal
    function execute_proposal(
        proposal_id: u64
    ) -> bool {
        ensure proposals.contains(proposal_id);
        ensure votes[proposal_id].1;
        let (description, target, amount, executed) = proposals[proposal_id];
        ensure !executed;
        tALEO.mint(target, amount);
        proposals[proposal_id] = (description, target, amount, true);
        return true;
    }
}
