import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  bool _isLoading = false;
  int _uploadedFiles = 0;

  // 4.1
  Future<void> _startUpload() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _uploadedFiles++;
    });

    // 4.2
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('File uploaded successfully'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            if (mounted) setState(() => _uploadedFiles--);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 4: Feedback')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uploaded files: $_uploadedFiles'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _startUpload,
              icon: const Icon(Icons.cloud_upload),
              label: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
