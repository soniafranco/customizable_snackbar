import 'package:customizable_snackbar/customizable_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// Example app demonstrating the customizable snackbar package.
class MyApp extends ConsumerStatefulWidget {
  /// Creates a new [MyApp] widget.
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    CustomizableSnackbar.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customizable Snackbar Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      builder: (context, child) => Stack(
        children: [
          child!,
          const CustomizableSnackbarOverlay(),
        ],
      ),
    );
  }
}

/// Home page widget that demonstrates various snackbar features.
class MyHomePage extends ConsumerWidget {
  /// Creates a new [MyHomePage] widget.
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Customizable Snackbar Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                CustomizableSnackbar.add(
                  ref: ref,
                  builder: (context) => const BasicSnackbar(
                    title: 'Hello',
                    message: 'This is a basic snackbar message',
                  ),
                );
              },
              child: const Text('Show Basic Snackbar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CustomizableSnackbar.add(
                  ref: ref,
                  builder: (context) => const BasicSnackbar(
                    title: 'Success',
                    message: 'Operation completed successfully',
                    leading: Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Show Success Snackbar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CustomizableSnackbar.add(
                  ref: ref,
                  builder: (context) => BasicSnackbar(
                    title: 'Tap me',
                    message: 'This snackbar is tappable',
                    onTap: () {
                      debugPrint('Snackbar tapped!');
                    },
                  ),
                );
              },
              child: const Text('Show Tappable Snackbar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                for (var i = 1; i <= 5; i++) {
                  CustomizableSnackbar.add(
                    ref: ref,
                    builder: (context) => BasicSnackbar(
                      title: 'Snackbar $i',
                      message: 'This is snackbar number $i',
                    ),
                  );
                }
              },
              child: const Text('Show Multiple Snackbars'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CustomizableSnackbar.add(
                  ref: ref,
                  builder: (context) => BasicSnackbar(
                    title: 'Custom Styled',
                    message: 'This snackbar has custom styling',
                    backgroundColor: Colors.blue.withValues(alpha: 0.9),
                    cornerRadius: 20,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    messageStyle: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                );
              },
              child: const Text('Show Custom Styled Snackbar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CustomizableSnackbar.add(
                  ref: ref,
                  builder: (context) => CustomSnackbar(
                    builder: (context) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.purple.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'This is a completely custom snackbar!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Show Custom Snackbar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CustomizableSnackbar.hideFirst(ref: ref);
              },
              child: const Text('Hide First Snackbar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CustomizableSnackbar.resetQueue(ref: ref);
              },
              child: const Text('Reset Queue'),
            ),
          ],
        ),
      ),
    );
  }
}
