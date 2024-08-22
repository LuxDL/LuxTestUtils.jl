module LuxTestUtils

using ComponentArrays: ComponentArray, getdata, getaxes
using DispatchDoctor: allow_unstable
using Functors: Functors
using MLDataDevices: cpu_device, gpu_device, get_device, get_device_type, AbstractGPUDevice
using Test: Test, Error, Broken, Pass, Fail, get_testset, @testset, @test, @test_skip,
            @test_broken, eval_test, Threw, Returned

# Autodiff
using ADTypes: AutoEnzyme, AutoFiniteDiff, AutoTracker, AutoForwardDiff, AutoReverseDiff,
               AutoZygote
using ChainRulesCore: ChainRulesCore
using FiniteDiff: FiniteDiff
using ForwardDiff: ForwardDiff
using ReverseDiff: ReverseDiff
using Tracker: Tracker
using Zygote: Zygote

const CRC = ChainRulesCore
const FD = FiniteDiff

# Check if JET will work
try
    using JET: JET, JETTestFailure, get_reports, report_call, report_opt
    global JET_TESTING_ENABLED = true
catch err
    @error "`JET.jl` did not successfully precompile on $(VERSION). All `@jet` tests will \
            be skipped." maxlog=1 err=err
    global JET_TESTING_ENABLED = false
end

# Check if Enzyme will work. Do this test in a different process to avoid crashing the main
# process.
try
    using Enzyme: Enzyme

    filepath = joinpath(@__DIR__, "enzyme_functional.jl")
    tmp_out, tmp_err = tempname(), tempname()
    # run(pipeline(`$(Base.julia_cmd()) --project=$(tdir) $(filepath)`;
    #     stdout=tmp_out, stderr=tmp_err))
    run(`$(Base.julia_cmd()) --project=$(joinpath(@__DIR__, "..")) $(filepath)`)

    global ENZYME_TESTING_ENABLED = true
catch err
    @error "`Enzyme.jl` is currently not functional on $(VERSION). Enzyme tests will be \
            skipped." maxlog=1 err=err
    global ENZYME_TESTING_ENABLED = false
end

include("test_softfail.jl")
include("utils.jl")
include("autodiff.jl")
include("jet.jl")

export AutoEnzyme, AutoFiniteDiff, AutoTracker, AutoForwardDiff, AutoReverseDiff, AutoZygote
export test_gradients
export @jet, jet_target_modules!
export @test_softfail

end
