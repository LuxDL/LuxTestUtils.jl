using Enzyme: Enzyme

# scalar test
ftest_scalar(x) = x
Enzyme.autodiff(Enzyme.Reverse, ftest_scalar, Enzyme.Active, Enzyme.Active(2.0))

# vector test
ftest_vec(x) = sum(abs2, x * x)
Enzyme.autodiff(
    Enzyme.Reverse, ftest_vec, Enzyme.Active, Enzyme.Duplicated(ones(2, 2), zeros(2, 2)))
