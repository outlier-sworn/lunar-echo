# Lunar Echo (Built for Base)

Lunar Echo is a compact, read-only tool designed to facilitate the inspection and validation of the Base Sepolia network. It allows developers to verify wallet balances, monitor network status, and confirm contract deployments without affecting the blockchain state.

---

## Core Features

Lunar Echo enables you to:
- **Verify Network Connection**: Ensure you’re connected to Base Sepolia (chainId: 84532)  
- **Inspect Wallet Balances**: Quickly check the balance of any wallet  
- **Validate Contract Deployments**: Use verified explorer links to confirm contract deployments  
- **View Block and Gas Data**: Retrieve details on recent blocks and gas usage  

All operations are strictly read-only, meaning no changes are made to the blockchain.

---

## How It Works

Lunar Echo connects to Coinbase Wallet via the Coinbase Wallet SDK, and queries the Base Sepolia network using the viem library. It retrieves important onchain data, including wallet balances, transaction counts, block information, and gas prices. This tool provides direct explorer links for easy manual verification.

It does not sign or broadcast any transactions, ensuring no state changes on the blockchain.

---

## Repository Structure

- **app/lunar-echo.ts**  
  This is the core script that connects to Coinbase Wallet and interacts with the Base Sepolia network to fetch blockchain data.

- **contracts/**  
  Solidity contracts deployed to Base Sepolia for testnet validation:
  - `BaseReferralSystem.sol` - a simple referral system contract that rewards users with tokens for referring others to the platform.
  - `BaseRoyaltyPayment.sol` - a royalty payment contract that allows creators to receive a percentage of the sales whenever their product is resold

- **scripts/**  
  Includes utility scripts for testing and contract deployment:
  - `deploy-contracts.sh`
  - `test-addresses.json`

- **package.json**  
  Defines the project dependencies.

- **README.md**  
  This documentation file you're reading.

---

## Supported Networks

- **Base Sepolia**  
  - **ChainId (decimal)**: 84532  
  - **Explorer**: [sepolia.basescan.org](https://sepolia.basescan.org)

---

## Usage

To get started with Lunar Echo:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/your-handle/lunar-echo.git
    cd lunar-echo
    ```

2. **Install the dependencies:**
    ```bash
    npm install
    ```

3. **Run the tool:**
    ```bash
    ts-node app.lunar-echo.ts
    ```

This will connect to Base Sepolia, check your wallet balance, and output the latest block and gas data.

---

## Dependencies

Lunar Echo utilizes the following dependencies:
- **Coinbase Wallet SDK**: For integrating Coinbase Wallet  
- **Viem**: For communication with the Base network  
- **Axios**: For making HTTP requests  
- **Web3.js**: For wallet interaction  
- **Ethers.js**: For additional Ethereum functionality  

Additional dependencies:
- **Base Repositories**: Includes tools and libraries from the Base ecosystem
- **Coinbase Wallet SDK**: For accessing and interacting with Coinbase Wallet securely

---

## License

MIT License  
Copyright (c) 2025 YOUR_NAME

---

## Testnet Deployment (Base Sepolia)

The following contracts were deployed to Base Sepolia for validation purposes:

Network: Base Sepolia  
chainId (decimal): 84532  
Explorer: [sepolia.basescan.org](https://sepolia.basescan.org)

Contract BaseReferralSystem.sol address:  
0x8A7C5F9E6B1D3F4A2B7C8F1D9A6F0B5D4A8E3C9F

Deployment and verification:
- [Deployment Link](https://sepolia.basescan.org/address/0x8A7C5F9E6B1D3F4A2B7C8F1D9A6F0B5D4A8E3C9F)
- [Code Verification](https://sepolia.basescan.org/0x8A7C5F9E6B1D3F4A2B7C8F1D9A6F0B5D4A8E3C9F/0#code)

Contract BaseRoyaltyPayment.sol address:  
0xD5A3F7C2B9E1C4A8E2B7D3F9A6C8F7C1B5D8A2C3

Deployment and verification:
- [Deployment Link](https://sepolia.basescan.org/address/0xD5A3F7C2B9E1C4A8E2B7D3F9A6C8F7C1B5D8A2C3)
- [Code Verification](https://sepolia.basescan.org/0xD5A3F7C2B9E1C4A8E2B7D3F9A6C8F7C1B5D8A2C3/0#code)

These deployments are part of the process to validate Base Sepolia network functionality and the associated tooling before moving to Mainnet.

---

## Author

GitHub: [outlier-sworn](https://github.com/outlier-sworn)  
Email: malware-rucks0q@icloud.com
