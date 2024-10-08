# Changelog

All notable changes to this project since the release of v1 will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2024-09-22

### Added

  - Adds a kwarg `enzyme_set_runtime_activity` to `test_gradients` to allow users to set
    the runtime activity of Enzyme tests.

## [1.2.0] - 2024-09-18

### Added

  - By default, we no longer wrap the entire gradient computation in a `@test` macro.

## [1.1.4] - 2024-08-21

### Fixed

  - Enzyme tests are now skipped if the version is a prerelease. [\[#30\]](https://github.com/LuxDL/LuxTestUtils.jl/pull/30)

## [1.1.3] - 2024-08-08

### Fixed

  - Fixed non-public API usage of `AutoEnzyme`. [\[#28\]](https://github.com/LuxDL/LuxTestUtils.jl/pull/26)

## [1.1.2] - 2024-07-28

### Fixed

  - Tracker support for wrapper array types. [\[#25\]](https://github.com/LuxDL/LuxTestUtils.jl/pull/25)

## [1.1.1] - 2024-07-28

### Fixed

  - Tracker gradients with ComponentArrays.
    [\[#24\]](https://github.com/LuxDL/LuxTestUtils.jl/pull/24)

## [1.1.0] - 2024-07-28

### Added

  - `@test_softfail` macro marks a test as broken if it fails else it passes.
    [\[#23\]](https://github.com/LuxDL/LuxTestUtils.jl/pull/23)
  - `soft_fail` kwarg introdced in `test_gradients` to mark a test as broken if it
    fails. [\[#23\]](https://github.com/LuxDL/LuxTestUtils.jl/pull/23)

### Changed

  - `skip_backends` use `skip` kwarg in `@test` macro and show up as broken in the test
    summary. [\[#23\]](https://github.com/LuxDL/LuxTestUtils.jl/pull/23)
  - If `Enzyme.jl` fails to load, then Enzyme tests will be skipped.
    [\[#23\]](https://github.com/LuxDL/LuxTestUtils.jl/pull/23)

## [1.0.1] - 2024-07-27

### Fixed

  - GPU device detection in `test_gradients`.
