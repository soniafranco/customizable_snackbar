# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.1] - 2025-01-27

### Changed

- Optimized dependency version constraints for better pub.dev scoring and backward compatibility
- Updated `flutter_lints` to support both 5.x and 6.x versions

## [1.1.0] - 2025-01-27

### Changed

- Updated dependencies and analysis options
- Refactored snackbar queue provider for improved readability and structure
- Improved code formatting and comments in snackbar widgets

## [1.0.0] - 2025-11-06

### Added

- Initial release of `customizable_snackbar`
- `CustomizableSnackbar` class for managing snackbars
- `BasicSnackbar` widget for displaying basic snackbars with title and message
- `CustomSnackbar` widget for creating custom snackbar widgets
- `SnackbarOverlay` widget for managing snackbar display and animations
- Queue management system with configurable maximum queue size
- Auto-hide functionality with configurable duration
- Dismissible snackbars with swipe-up gesture
- Smooth animations using `flutter_animate`
- Backdrop blur effect for glassmorphism
- Comprehensive documentation and examples

### Features

- Queue management with automatic positioning
- Customizable appearance (colors, styles, corner radius)
- Support for custom widgets
- Riverpod integration for state management
- Responsive positioning to avoid overlap
- Multiple snackbar support with stacking
