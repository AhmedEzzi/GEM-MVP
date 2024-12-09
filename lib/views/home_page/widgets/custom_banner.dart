import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


class DynamicBanner extends StatefulWidget {
  const DynamicBanner({super.key});

  @override
  State<DynamicBanner> createState() => _DynamicBannerState();
}

class _DynamicBannerState extends State<DynamicBanner> {
  final List<Map<String, String>> bannerData = [
    {
      'image':
          'https://www.visit-gem.com/storage/informations1675951038Side-Image-01.jpg',
      'caption': 'WELCOME TO THE GRAND EGYPTIAN MUSEUM'
    },
    {
      'image':
          'https://www.visit-gem.com/storage/informations1675951038Side-Image-01.jpg',
      'caption': 'DISCOVER ANCIENT EGYPT'
    },
    {
      'image':
          'https://www.visit-gem.com/storage/informations1675951038Side-Image-01.jpg',
      'caption': 'EXPLORE ARTIFACTS'
    },
  ];

  int _currentIndex = 0;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  // Check if the device is connected to the internet
  void _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 158.0,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 16 / 9,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        items: bannerData.map((data) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: _isConnected
                        // Load network image if connected
                        ? Image.network(
                            data['image']!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey,
                                child: const Icon(Icons.error,
                                    color: Colors.white),
                              );
                            },
                          )
                        // Load image from assets if not connected
                        : Image.asset(
                            'assets/png/banner.png', // Placeholder asset image
                            fit: BoxFit.cover,
                          ),
                  ),
                  Center(
                    child: Text(
                      data['caption']!,
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'Inter'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          bannerData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 8,
                            width: _currentIndex == index ? 16 : 8,
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
