use yieldstark_contract::interfaces::IYieldStark;

#[starknet::contract]
mod YieldStark {
    use yieldstark_contract::erc20::IERC20DispatcherTrait;
    use core::clone::Clone;
    use yieldstark_contract::interfaces::IYieldStark;
    use starknet::{get_caller_address, ContractAddress, get_contract_address, get_block_timestamp};
    use yieldstark_contract::utils::{UserAddress, TokenAddress, Amount};
    use yieldstark_contract::erc20::{IERC20Dispatcher};
    use starknet::contract_address_const;
    
    #[storage]
    struct Storage {
    }

    #[constructor]
    fn constructor(ref self: ContractState) {
    }

    #[abi(embed_v0)]
    impl YieldStarkImpl of super::IYieldStark<ContractState> {
        fn get_balance(self: @ContractState, token_address: TokenAddress, agent_address: UserAddress) -> Amount {
            let token: IERC20Dispatcher = IERC20Dispatcher {
                contract_address: token_address,
            };

            token.balanceOf(agent_address)
        }
    }
}
