import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/app_state.dart';
import 'package:hackathon/responsive.dart';
import 'package:hackathon/settings.dart';
import 'package:hackathon/tabs/invest/fund_list.dart';
import 'package:hackathon/tabs/order/order_home.dart';
import 'package:hackathon/tabs/portfolio/portfolio_home.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: context.watch<AppState>().homeBottonNavIndex==1 ? null : AppBar(
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.balance),
            ),
            Text(title,)
          ],
        ),
        elevation: 4,
        shadowColor: Theme.of(context).shadowColor,
      ),
      drawer: NavigationDrawer(       
        children: const [
          NavigationDrawerDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
                )
        ],
        onDestinationSelected: (value) {
          if(value==0){
            Navigator.pop(context);
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, a, b)=> const SettingsHome() ));
          }
        },
      ),
      body:  Row(
        children: [
          if(ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context))
            NavigationRail(
              destinations: navRailDestinations,
               selectedIndex: context.watch<AppState>().homeBottonNavIndex,
               onDestinationSelected: (index) {
                 if (index != context.read<AppState>().homeBottonNavIndex) {
                  context.read<AppState>().updateHomeBottonNavIndex(index);
                }
               },
               ),
            Expanded(
              child: PageTransitionSwitcher(
                  transitionBuilder: (child, animation, secondaryAnimation) {
                    return FadeThroughTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: child,
                    );
                  },
                  child: _NavigationDestinationView(
                      viewIndex: context.watch<AppState>().homeBottonNavIndex),
              ),
            ),
        ],
      ),
      bottomNavigationBar: ResponsiveWidget.isSmallScreen(context) ? BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: context.watch<AppState>().homeBottonNavIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          if(index != context.read<AppState>().homeBottonNavIndex){
            context.read<AppState>().updateHomeBottonNavIndex(index);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.card_travel_rounded),label: "Portifolio"),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money_rounded),label: "Invest"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label:'Orders'),
        ],
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        backgroundColor: colorScheme.primary,
      ) : null,
    );
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({required this.viewIndex});
  final int viewIndex;
  @override
  Widget build(BuildContext context) {
    switch(viewIndex){
      case 0:
        return const PortfolioHomePage();
      case 1:
        return const FundListPage(categoryName: "",catergoryValue: "",);
      case 2:
        return const OrderHomePage();
      default:
        return Container();
    }  
  }
}

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.card_travel_rounded),
    label: 'Portifolio',
    selectedIcon: Icon(Icons.widgets),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.attach_money_rounded),
    label: 'Invest',
    selectedIcon: Icon(Icons.format_paint),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Icons.shopping_cart_outlined),
    label: 'Orders',
    selectedIcon: Icon(Icons.text_snippet),
  ),
];

const List<NavigationRailDestination> navRailDestinations = [
  NavigationRailDestination(
    icon: Icon(Icons.card_travel_rounded),
    label: Text('Portifolio'),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.attach_money_rounded),
    label: Text('Invest'),
    selectedIcon: Icon(Icons.format_paint),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.shopping_cart_outlined),
    label: Text('Orders'),
    selectedIcon: Icon(Icons.shopping_cart),
  ),
];