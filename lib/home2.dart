import 'package:flutter/material.dart';
import 'package:hackathon/app_state.dart';
import 'package:hackathon/chat/chat_screen.dart';
import 'package:hackathon/responsive.dart';
import 'package:hackathon/settings.dart';
import 'package:hackathon/tabs/invest/invest_home.dart';
import 'package:hackathon/tabs/order/order_home.dart';
import 'package:hackathon/tabs/portfolio/portfolio_home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(title, context),
      bottomNavigationBar: createBottomNavBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () => {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, a, b) => const ChatScreen()))
        },
        child: const Icon(Icons.chat),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if(constraints.maxWidth < 800){
          return createComponentFor(context);
        }
        else {
            return Row(children: [
              NavigationRail(
                destinations: navRailDestinations,
                selectedIndex: context.watch<AppState>().homeBottonNavIndex,
                extended: ResponsiveWidget.isLargeScreen(context),
                onDestinationSelected: (value) {
                  context.read<AppState>().updateHomeBottonNavIndex(value);      
                },
                labelType: ResponsiveWidget.isMediumScreen(context) ? NavigationRailLabelType.selected : NavigationRailLabelType.none,
              ),
              Expanded(child: Card(
                elevation: 1.0,
                child: createComponentFor(context)))
            ]);
          }
      },),
    );
  }

  PreferredSizeWidget createAppBar(String title, BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: const Icon(Icons.balance),
      elevation: 8.0,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Tooltip(
            message: 'Toggle brightness',
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsHome(),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget? createBottomNavBar(BuildContext context) {
    final colorSheme = Theme.of(context).colorScheme;
    if (ResponsiveWidget.isSmallScreen(context)) {
      return NavigationBar(
        indicatorColor: colorSheme.primaryContainer,
        destinations: navBarDestinations,
        selectedIndex: context.watch<AppState>().homeBottonNavIndex,
        onDestinationSelected: (value) {
          context.read<AppState>().updateHomeBottonNavIndex(value);
        },
      );
    }
    return null;
  }
}

Widget createComponentFor(BuildContext context) {
  switch (context.watch<AppState>().homeBottonNavIndex) {
    case 0:
      return PortfolioHomePage();
    case 1:
      return InvestHome();
    case 2:
      return OrderHomePage();
    default:
      return Container();
  }
}

List<Widget> navBarDestinations = const <NavigationDestination> [
  NavigationDestination(
    tooltip: 'Portifolio',
    icon: Icon(Icons.card_travel_outlined),
    label: 'Portifolio',
    selectedIcon: Icon(Icons.card_travel),
  ),
  NavigationDestination(
    tooltip: 'Invest',
    icon: Icon(Icons.attach_money_outlined),
    label: 'Invest',
    selectedIcon: Icon(Icons.attach_money),
  ),
  NavigationDestination(
    tooltip: 'Orders',
    icon: Icon(Icons.shopping_cart_outlined),
    label: 'Orders',
    selectedIcon: Icon(Icons.shopping_cart),
  ),
];

const List<NavigationRailDestination> navRailDestinations = [
  NavigationRailDestination(
    icon: Icon(Icons.card_travel_outlined),
    label: Text('Portifolio'),
    selectedIcon: Icon(Icons.card_travel),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.attach_money_outlined),
    label: Text('Invest'),
    selectedIcon: Icon(Icons.attach_money),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.shopping_cart_outlined),
    label: Text('Orders'),
    selectedIcon: Icon(Icons.shopping_cart),
  ),
];
