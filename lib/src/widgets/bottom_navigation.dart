import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int index;
  final PageController pageController;
  const BottomNavigation({
    required this.index,
    required this.pageController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 12,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (int i) {
            pageController.animateToPage(
              i,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCirc,
            );
          },
          selectedLabelStyle: TextStyle(
            fontSize: screenWidth * 0.034,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: screenWidth * 0.03,
          ),
          unselectedItemColor:
              Theme.of(context).colorScheme.secondary.withOpacity(
                    0.8,
                  ),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 26,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book_rounded,
                size: 22,
              ),
              label: "Bookings",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer_rounded,
                size: 22,
              ),
              label: "Offers",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_rounded,
                size: 22,
              ),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_rounded,
                size: 28,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
