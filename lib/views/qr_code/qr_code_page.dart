import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  final MobileScannerController controller = MobileScannerController();
  String? imageUrl; // Holds the URL if a .jpg image is found.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Kiosk Camera"),
        actions: [
          imageUrl == null
              ? IconButton(
                  icon: const Icon(Icons.flash_on),
                  onPressed: () => controller.toggleTorch(),
                )
              : IconButton(
                  onPressed: () {
                    // Replace the current image with a new one when the icon is pressed.
                    setState(() {
                      imageUrl =
                          "https://www.ahmedezz.work/gem/PHOTO-2024-12-10-15-17-36.jpg"; // Replace with a new URL or image.
                    });
                  },
                  icon: const Icon(Icons.accessibility),
                ),
          IconButton(
            onPressed: () {
              // Replace the current image with a new one when the icon is pressed.
              setState(() {
                imageUrl =
                    "https://www.ahmedezz.work/gem/enhanace.jpg"; // Replace with a new URL or image.
              });
            },
            icon: const Icon(Icons.energy_savings_leaf_rounded),
          ),
          IconButton(
            onPressed: () {
              // Replace the current image with a new one when the icon is pressed.
              setState(() {
                imageUrl =
                    "https://www.ahmedezz.work/gem/background.jpg"; // Replace with a new URL or image.
              });
            },
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: imageUrl == null
          ? Column(
              children: [
                // Camera scanner view
                Expanded(
                  child: MobileScanner(
                    controller: controller,
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        final String? rawValue = barcode.rawValue;
                        if (rawValue != null && rawValue.endsWith('.jpg')) {
                          setState(() {
                            imageUrl = rawValue; // Set the image URL
                          });
                          // Stop the scanner after the QR code is detected
                          controller.stop();
                        }
                      }
                    },
                  ),
                ),
              ],
            )
          : GestureDetector(
              onTap: () {
                // Close the image view and go back to scanner
                setState(() {
                  imageUrl = null;
                });
                controller.start(); // Restart the scanner
              },
              child: Center(
                child: InteractiveViewer(
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text("Failed to load image"),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
