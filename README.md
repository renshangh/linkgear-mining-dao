**Mission:** Oversee a decentralized, privacy-first mining organization that mines multiple cryptocurrencies (ALEO, BTC, Doge), governed by tALEO token holders who select miners, allocate funds, and distribute rewards transparently using Aleo’s zero-knowledge technology and Lido’s scalable framework.

**Audience:** It enables smaller investments growing together for decisions, purchasing, hosting and rewards distritrution in mining efforts.

The phase 1 of MVP will focus solely on Aleo mining, excluding BTC, Doge, and other coins. This narrows the Mining DAO’s MVP to a privacy-first, Aleo-specific operation leveraging Aleo’s proof-of-succinct-work (PoSW) and zk-SNARKs and governed by tALEO holders. 

---

### 1. Describe MVP: the minimum viable product we intend to build during the START grant phase
The Minimum Viable Product (MVP) for the Mining DAO during the START grant phase will be a testnet-deployed prototype of a decentralized Aleo mining DAO, focusing on governance and reward simulation using Aleo’s blockchain. This aligns with our "Phase 1: Bootstrapping on Aleo Testnet (Q2 2025)" roadmap, emphasizing Aleo-only mining.

- **Components**:
  - **Governance Contracts**: Smart contracts on Aleo testnet enabling private voting (via zk-SNARKs) for selecting Aleo miners/provers and allocating mock rewards.
  - **Aleo Mining Simulator**: A system simulating Aleo PoSW mining outputs, tracking "proof efficiency" contributions from testnet participants (e.g., mock provers or using DxPool mining data as a whole).
  - **User Interface**: A basic dashboard (prototyped with Cordia AI ) showing voting options, simulated Aleo rewards, and participant stats. 
  - **Testnet tALEO Token**: A placeholder token for staking and governance, with snapshots for future airdrop eligibility on mainnet.

- **Scope**: The MVP focuses exclusively on Aleo mining, testing governance and reward mechanics in a risk-free testnet environment without real hardware or multi-coin complexity. The START grant phase will focus on Aleo DAO smart contrats building on Aleo Testnet, namely, 
  1. create proposal, 
  2. take votes, 
  3. track daily rewards,
  4. record feedbacks,
  5. distribute rewards.

- **Why This MVP?**: It proves the concept of a privacy-first Aleo mining DAO governed by tALEO holders, leveraging Aleo’s zero-knowledge tech and Aleo Vote-based’s governance model (will be extended into the tALEO specs). It’s minimal yet validates the DAO’s core value proposition for the START grant phase.

---

### 2. Functionality for the User, ie, what primary functionality will the MVP offer to users? What problem does it solve?
The MVP will offer two key functionalities for users—testnet participants such as potential Aleo miners/provers and stakers—solving the problem of establishing trust and governance in a decentralized Aleo mining ecosystem. 

- **Primary Functionality**:
  1. **Private Governance Voting**:
     - Users stake testnet tALEO tokens to vote on mock Aleo miner/prover selection (e.g., approving a prover with high proof efficiency) and reward splits (e.g., 50% miners, 20% stakers, 30% treasury).
     - Uses Aleo’s zk-SNARKs for private, secure voting.
  2. **Simulated Aleo Reward Tracking**:
     - Users view mock Aleo mining rewards (e.g., 10 ALEO daily) based on simulated prover contributions, with a dashboard showing their share as stakers or "miners."
     - Tracks activity for future tALEO airdrops.

- **Problem Solved**:
  - **Governance Trust**: Aleo mining lacks decentralized, community-driven models. The MVP demonstrates how tALEO holders can privately govern miner selection and rewards, building confidence in the DAO’s fairness.
  - **Reward Clarity**: Potential miners and stakers need assurance of equitable payouts. The simulator shows how Aleo rewards could be distributed, addressing uncertainty in a new PoSW ecosystem.
  - **Early Engagement**: By offering a testnet with airdrop incentives, it solves the challenge of attracting Aleo enthusiasts to test and shape the DAO pre-mainnet.

- **Value**: Users gain experience with Aleo-specific governance and reward systems, providing feedback to refine the DAO while earning potential future tALEO.

---

### 3. User Flow or use cases: 
The user flow will focus on Aleo mining governance and reward simulation via a testnet dashboard. Here’s a step-by-step journey for a user—say, Sam, an Aleo enthusiast testing the DAO as a staker or prover:

- **Use Case**: Sam joins the Mining DAO MVP to vote on Aleo provers and track simulated rewards.
  1. **Step 1: Sign Up & Connect Wallet**
     - Sam visits the Mining DAO testnet site, say linkgear.io (available but not functional), connects an Aleo-compatible wallet (e.g., Leo or Puzzle), and claims testnet tALEO tokens from a faucet.
  2. **Step 2: Stake tALEO Tokens**
     - Sam goes to the “Staking” section, stakes 100 testnet tALEO tokens, and sees confirmation of governance eligibility.
  3. **Step 3: Vote on Prover Selection**
     - In the “Governance” tab, Sam reviews mock prover proposals (e.g., Prover A: 100 proofs/day, Prover B: 50 proofs/day). He votes privately for Prover A using zk-SNARKs.
  4. **Step 4: Check Simulated Rewards**
     - Sam checks the “Rewards” dashboard, seeing simulated Aleo output (e.g., 10 ALEO daily total). As a staker, he’s credited 20% (e.g., 2 ALEO).
  5. **Step 5: Provide Feedback**
     - Sam submits feedback via a form (e.g., “Show proof efficiency metrics”), earning extra testnet tALEO.
  6. **Step 6: Snapshot Confirmation**
     - At the phase’s end, Sam receives a notification that his staking and voting are snapshotted for a future tALEO airdrop.

- **Flow Summary**: Connect → Stake → Vote → Track Rewards → Feedback → Snapshot. This tests Aleo-specific governance and reward visibility with privacy at its core.

---

### 4. Expected Timeline: What is the estimated time to complete the MVP?
**Revised Suggestion**: The timeline remains aligned with "Phase 1: Bootstrapping on Aleo Testnet (Q2 2025)"—April to June 2025—but is slightly streamlined since we’re focusing only on Aleo mining, reducing multi-coin complexity. Assuming the START grant phase begins in April 2025 and leverages your team (e.g., Linkgear Foundation’s Aleo devs and Ren Shan), here’s the revised estimate:

- **Total Duration**: ~10 weeks (2.5 months), from April 1, 2025, to June 15, 2025.
- **Breakdown**:
  1. **Weeks 1-2: Planning & Setup (April 1 - April 14)**  
     - Define MVP scope (Aleo-only), set prover criteria, and prepare Aleo testnet.
     - Team: Aleo developers initialize environment.
  2. **Weeks 3-4: Smart Contract Development (April 15 - April 28)**  
     - Build zk-SNARK voting and Aleo reward simulation contracts (mock PoSW outputs).
     - Team: Blockchain devs use snarkOS/snarkVM.
  3. **Weeks 5-6: UI Prototyping & Integration (April 29 - May 12)**  
     - Prototype dashboard (voting, rewards, staking) with Visily, export to React/TypeScript, and connect to testnet contracts.
     - Team: Ren Shan handles front-end integration.
  4. **Weeks 7-8: Testing & Refinement (May 13 - May 26)**  
     - Test with 50-100 participants, focusing on voting and reward tracking.
     - Refine based on feedback.
  5. **Weeks 9-10: Finalization & Snapshot (May 27 - June 15)**  
     - Finalize MVP, snapshot activity for airdrops, and prepare grant demo.
     - Deliver to START grant reviewers.

- **Assumptions**:
  - Team of 3-4 (e.g., 2 Aleo devs, 1 full-stack, 1 tester).
  - Aleo testnet is stable (post-mainnet September 2024).
  - START grant funds (~$50k) cover dev time and minimal costs.

- **Why 10 Weeks?**: Focusing on Aleo simplifies the simulator and contracts, shaving ~2 weeks off the original 12-week estimate. Visily’s free tier speeds UI development, and your team’s Aleo expertise ensures efficiency.

---
