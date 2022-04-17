import 'package:aplikasi_shopii/models/product_model.dart';
import 'package:aplikasi_shopii/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brands_rail_widget.dart';

class BrandNavigationRailScreen extends StatefulWidget {
  const BrandNavigationRailScreen({Key? key}) : super(key: key);

  static const routeName = '/brands_navigation_rail';
  @override
  _BrandNavigationRailScreenState createState() =>
      _BrandNavigationRailScreenState();
}

class _BrandNavigationRailScreenState extends State<BrandNavigationRailScreen> {
  int _selectedIndex = 7;
  final padding = 8.0;
  String? routeArgs;
  String? brand;
  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context)?.settings.arguments.toString();
    _selectedIndex = int.parse(
      routeArgs!.substring(1, 2),
    );
    print(routeArgs.toString());
    if (_selectedIndex == 0) {
      setState(() {
        brand = 'Addidas';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brand = 'Apple';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brand = 'Dell';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brand = 'H&M';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brand = 'Nike';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brand = 'Samsung';
      });
    }
    if (_selectedIndex == 6) {
      setState(() {
        brand = 'Huawei';
      });
    }
    if (_selectedIndex == 7) {
      setState(() {
        brand = 'All';
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraint.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      minWidth: 56.0,
                      groupAlignment: 1.0,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                          switch (_selectedIndex) {
                            case 0:
                              setState(() {
                                brand = 'Addidas';
                              });
                              break;
                            case 1:
                              setState(() {
                                brand = 'Apple';
                              });
                              break;
                            case 2:
                              setState(() {
                                brand = 'Dell';
                              });
                              break;
                            case 3:
                              setState(() {
                                brand = 'H&M';
                              });
                              break;
                            case 4:
                              setState(() {
                                brand = 'Nike';
                              });
                              break;
                            case 5:
                              setState(() {
                                brand = 'Samsung';
                              });
                              break;
                            case 6:
                              setState(() {
                                brand = 'Huawei';
                              });
                              break;
                            default:
                              setState(() {
                                brand = 'All';
                              });
                              break;
                          }
                          print(brand);
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      leading: Column(
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                  'https://www.freepnglogos.com/uploads/darth-vader-png/vector-profile-darth-vader-frames-illustrations-32.png'),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                      selectedLabelTextStyle: const TextStyle(
                        color: Color(0xffffe6bc97),
                        fontSize: 20,
                        letterSpacing: 1,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.5,
                      ),
                      unselectedLabelTextStyle: const TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.8,
                      ),
                      destinations: [
                        buildRotatedTextRailDestination('Addidas', padding),
                        buildRotatedTextRailDestination('Apple', padding),
                        buildRotatedTextRailDestination('Dell', padding),
                        buildRotatedTextRailDestination('H&M', padding),
                        buildRotatedTextRailDestination('Nike', padding),
                        buildRotatedTextRailDestination('Samsung', padding),
                        buildRotatedTextRailDestination('Huawei', padding),
                        buildRotatedTextRailDestination('All', padding),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // This is the main content.

          ContentSpace(context, brand!)
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: const SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  // final int _selectedIndex;

  final String brand;
  ContentSpace(BuildContext context, this.brand);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context, listen: false);
    final productBrands = productData.findByBrand(brand);
    if (brand == 'All') {
      for (var i = 0; i < productData.products.length; i++) {
        productBrands.add(productData.products[i]);
      }
    }
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        margin: const EdgeInsets.only(top: 12),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            // shrinkWrap: true,
            itemCount: productBrands.length,
            itemBuilder: (BuildContext context, int index) =>
                ChangeNotifierProvider.value(
              value: productBrands[index],
              child: const BrandsNavigationRail(),
            ),
          ),
        ),
      ),
    );
  }
}
