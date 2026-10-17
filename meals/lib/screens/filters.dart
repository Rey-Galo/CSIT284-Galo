import 'package:flutter/material.dart';
import 'package:meals/theme/midnight_kitchen.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  Widget _buildHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MAKE IT YOURS',
            style: textTheme.labelSmall!.copyWith(
              color: MidnightKitchen.amber,
              fontSize: 10,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Your Filters',
            style: textTheme.headlineLarge!.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              height: 1.12,
              letterSpacing: -1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Choose which meals appear in your categories.',
            style: textTheme.bodySmall!.copyWith(color: MidnightKitchen.muted),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.soup_kitchen_outlined,
              size: 22,
              color: MidnightKitchen.amber,
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(context),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          switchTheme: SwitchThemeData(
                            thumbColor: WidgetStateProperty.resolveWith(
                              (states) => states.contains(WidgetState.selected)
                                  ? MidnightKitchen.onAmber
                                  : MidnightKitchen.muted,
                            ),
                            trackColor: WidgetStateProperty.resolveWith(
                              (states) => states.contains(WidgetState.selected)
                                  ? MidnightKitchen.amber
                                  : MidnightKitchen.soft,
                            ),
                            trackOutlineColor: WidgetStateProperty.resolveWith(
                              (states) => states.contains(WidgetState.selected)
                                  ? MidnightKitchen.amber
                                  : MidnightKitchen.muted,
                            ),
                          ),
                        ),
                        child: Material(
                          color: MidnightKitchen.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              SwitchListTile(
                                value: _glutenFreeFilterSet,
                                onChanged: (isChecked) {
                                  setState(() {
                                    _glutenFreeFilterSet = isChecked;
                                  });
                                },
                                title: Text(
                                  'Gluten-free',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: MidnightKitchen.foreground,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                subtitle: Text(
                                  'Only include gluten-free meals.',
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: MidnightKitchen.muted),
                                ),
                                activeColor: MidnightKitchen.onAmber,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 20,
                                ),
                              ),
                              const Divider(
                                height: 1,
                                indent: 18,
                                endIndent: 18,
                              ),
                              SwitchListTile(
                                value: _lactoseFreeFilterSet,
                                onChanged: (isChecked) {
                                  setState(() {
                                    _lactoseFreeFilterSet = isChecked;
                                  });
                                },
                                title: Text(
                                  'Lactose-free',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: MidnightKitchen.foreground,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                subtitle: Text(
                                  'Only include lactose-free meals.',
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: MidnightKitchen.muted),
                                ),
                                activeColor: MidnightKitchen.onAmber,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 20,
                                ),
                              ),
                              const Divider(
                                height: 1,
                                indent: 18,
                                endIndent: 18,
                              ),
                              SwitchListTile(
                                value: _vegetarianFilterSet,
                                onChanged: (isChecked) {
                                  setState(() {
                                    _vegetarianFilterSet = isChecked;
                                  });
                                },
                                title: Text(
                                  'Vegetarian',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: MidnightKitchen.foreground,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                subtitle: Text(
                                  'Only include vegetarian meals.',
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: MidnightKitchen.muted),
                                ),
                                activeColor: MidnightKitchen.onAmber,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 20,
                                ),
                              ),
                              const Divider(
                                height: 1,
                                indent: 18,
                                endIndent: 18,
                              ),
                              SwitchListTile(
                                value: _veganFilterSet,
                                onChanged: (isChecked) {
                                  setState(() {
                                    _veganFilterSet = isChecked;
                                  });
                                },
                                title: Text(
                                  'Vegan',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: MidnightKitchen.foreground,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                subtitle: Text(
                                  'Only include vegan meals.',
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(color: MidnightKitchen.muted),
                                ),
                                activeColor: MidnightKitchen.onAmber,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            size: 16,
                            color: MidnightKitchen.muted,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Your choices apply when you go back.',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: MidnightKitchen.muted),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
