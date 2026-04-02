import 'package:customizable_snackbar/src/providers/snackbar_queue_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The action to take to remove a snackbar from the queue.
enum SnackbarExitAction {
  /// The snackbar will be dismissed.
  dismiss,

  /// The snackbar will be hidden.
  hide,
}

/// A class for managing customizable snackbars.
///
/// This class provides static methods to add, hide, and dismiss snackbars
/// from a queue. It uses Riverpod for state management.
class CustomizableSnackbar {
  static WidgetRef? _ref;

  /// Sets the global WidgetRef for snackbar management.
  ///
  /// This should be called once in your app, typically in the root widget.
  // ignore: use_setters_to_change_properties
  static void setRef(WidgetRef ref) {
    _ref = ref;
  }

  /// Adds a new snackbar to the queue.
  ///
  /// The [builder] function is called to build the snackbar widget.
  /// If [ref] is provided, it will be used instead of the global ref.
  static void add({
    required WidgetBuilder builder,
    WidgetRef? ref,
    String? id,
    SnackbarExitAction exitAction = SnackbarExitAction.dismiss,
  }) {
    final snackbarQueue = ref ?? _ref;
    snackbarQueue?.read(snackbarQueueProvider.notifier).add(
          builder,
          id: id,
          exitAction: exitAction,
        );
  }

  /// Hides a specific visible snackbar in the queue by its ID.
  ///
  /// If [ref] is provided, it will be used instead of the global ref.
  static void hide({required String id, WidgetRef? ref}) {
    final snackbarQueue = ref ?? _ref;
    snackbarQueue?.read(snackbarQueueProvider.notifier).hide(id);
  }

  /// Dismisses a specific snackbar by its ID.
  ///
  /// If [ref] is provided, it will be used instead of the global ref.
  static void dismiss({required String id, WidgetRef? ref}) {
    final snackbarQueue = ref ?? _ref;
    snackbarQueue?.read(snackbarQueueProvider.notifier).dismiss(id);
  }

  /// Resets the snackbar queue, removing all snackbars.
  ///
  /// If [ref] is provided, it will be used instead of the global ref.
  static void resetQueue({WidgetRef? ref}) {
    final snackbarQueue = ref ?? _ref;
    snackbarQueue?.read(snackbarQueueProvider.notifier).resetQueue();
  }

  /// Hides the first visible snackbar in the queue.
  ///
  /// This is an alias for [hide].
  /// If [ref] is provided, it will be used instead of the global ref.
  static void hideFirst({WidgetRef? ref}) {
    final snackbarQueue = ref ?? _ref;
    snackbarQueue?.read(snackbarQueueProvider.notifier).hideFirst();
  }
}
