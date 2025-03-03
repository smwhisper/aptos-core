module AptosFramework::AptosVMConfig {
    use Std::Capability;
    use AptosFramework::VMConfig;
    use AptosFramework::Marker;

    /// Publishes the VM config.
    public fun initialize(
        account: &signer,
        instruction_schedule: vector<u8>,
        native_schedule: vector<u8>,
        min_price_per_gas_unit: u64,
    ) {
        VMConfig::initialize<Marker::ChainMarker>(account, instruction_schedule, native_schedule, min_price_per_gas_unit);
    }

    public(script) fun set_gas_constants(
        account: signer,
        global_memory_per_byte_cost: u64,
        global_memory_per_byte_write_cost: u64,
        min_transaction_gas_units: u64,
        large_transaction_cutoff: u64,
        intrinsic_gas_per_byte: u64,
        maximum_number_of_gas_units: u64,
        min_price_per_gas_unit: u64,
        max_price_per_gas_unit: u64,
        max_transaction_size_in_bytes: u64,
        gas_unit_scaling_factor: u64,
        default_account_size: u64,
    ) {
        VMConfig::set_gas_constants<Marker::ChainMarker>(
            global_memory_per_byte_cost,
            global_memory_per_byte_write_cost,
            min_transaction_gas_units,
            large_transaction_cutoff,
            intrinsic_gas_per_byte,
            maximum_number_of_gas_units,
            min_price_per_gas_unit,
            max_price_per_gas_unit,
            max_transaction_size_in_bytes,
            gas_unit_scaling_factor,
            default_account_size,
            &Capability::acquire(&account, &Marker::get()),
        );
    }
}
