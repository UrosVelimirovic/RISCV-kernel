.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function

_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    # u a0 ide &old->context
    # u a1 ide &running->context

    sd ra, 0*8(a0)
    sd sp, 1*8(a0)

    ld ra, 0*8(a1)
    ld sp, 1*8(a1)

    ret