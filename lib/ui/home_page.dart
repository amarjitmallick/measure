import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:measure/theme/text_styles.dart';
import 'package:measure/theme/theme.dart';
import 'package:measure/ui/widgets/area_calculator.dart';
import 'package:measure/ui/widgets/length_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Measure",
          style: TextStyles.appBarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: MeasureTheme.tabBarBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: TabBar(
                  tabs: [
                    Text(
                      'Length',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Area',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MeasureTheme.indicatorColor,
                  ),
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 0,
                  unselectedLabelColor: MeasureTheme.unselectedLabelColor,
                  labelColor: MeasureTheme.selectedLabelColor,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  LengthCalculator(),
                  AreaConversionScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
