module account_mod
    implicit none
    private
    public :: account

    type :: account
        character(len=20) :: owner = ''
        real :: balance = 0.0
    contains
        procedure :: deposit
        procedure :: withdraw
        procedure :: show
    end type account

contains

    subroutine deposit(self, amount)
        class(account), intent(inout) :: self
        real, intent(in) :: amount
        self%balance = self%balance + amount
    end subroutine deposit

    subroutine withdraw(self, amount, ok)
        class(account), intent(inout) :: self
        real, intent(in) :: amount
        logical, intent(out) :: ok
        ok = amount <= self%balance
        if (ok) self%balance = self%balance - amount
    end subroutine withdraw

    subroutine show(self)
        class(account), intent(in) :: self
        print '(A, A, F8.2)', trim(self%owner), ': ', self%balance
    end subroutine show

end module account_mod

program type_bound_procedure_demo
    use account_mod
    implicit none
    type(account) :: acct
    logical :: ok

    acct = account('Ada', 100.0)
    call acct%deposit(50.0)
    call acct%withdraw(30.0, ok)
    call acct%show()
    call acct%withdraw(500.0, ok)
    print *, 'big withdrawal ok? ', ok
    call acct%show()
end program type_bound_procedure_demo
