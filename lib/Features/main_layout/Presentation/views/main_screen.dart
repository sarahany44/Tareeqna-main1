import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareeqna/Features/Favorite/Presentation/views/favorite_screen.dart';
import 'package:tareeqna/Features/Home/Presentation/views/home_map_screen.dart';
import 'package:tareeqna/Features/Offer/Presentation/views/offer_screen.dart';
import 'package:tareeqna/Features/Profile/Presentation/views/profile_screen.dart';
import 'package:tareeqna/Features/Wallet/Presentation/views/wallet_screen.dart';
import 'package:tareeqna/Features/Home/Data/datasources/location_service.dart';
import 'package:tareeqna/Features/Home/Data/repositories/location_repository.dart';
import 'package:tareeqna/Features/Home/domain/usecases/get_user_location_usecase.dart';
import 'package:tareeqna/Features/Home/Presentation/cubit/location_cubit/location_cubit.dart';

import 'package:tareeqna/constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late PageController _pageController;

  final List<Widget> _screens = [
    const HomeMapScreen(),
    const FavoriteScreen(),
    const WalletScreen(),
    const OfferScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // هنا بنوفر الـ LocationCubit لكل الـ screens
    return BlocProvider(
      create: (_) => LocationCubit(
        GetUserLocationUseCase(
          LocationRepository(LocationService()),
        ),
      )..fetchLocation(), // هيحمل مرة واحدة بس عند إنشاء الـ MainScreen
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        bottomNavigationBar: _buildAnimatedBottomNavBar(),
      ),
    );
  }

  Widget _buildAnimatedBottomNavBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
            index: 0,
          ),
          _buildNavItem(
            icon: Icons.favorite_outline,
            activeIcon: Icons.favorite,
            label: 'Favourite',
            index: 1,
          ),
          _buildNavItem(
            icon: Icons.wallet_outlined,
            activeIcon: Icons.wallet,
            label: 'Wallet',
            index: 2,
          ),
          _buildNavItem(
            icon: Icons.percent_outlined,
            activeIcon: Icons.percent_outlined,
            label: 'Offer',
            index: 3,
          ),
          _buildNavItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? kpimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? Colors.white : Colors.grey,
              size: 24,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isSelected
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}