use starknet::ContractAddress;
use yieldstark_contract::utils::{UserAddress, Amount, TokenAddress};

#[starknet::interface]
pub trait IYieldStark<TContractState> {
    fn get_balance(self: @TContractState, token_address: TokenAddress, agent_address: UserAddress) -> Amount;
}