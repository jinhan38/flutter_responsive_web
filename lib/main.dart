import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/route_page.dart';
import 'package:flutter_responsive_web/screen/company/company_screen.dart';
import 'package:flutter_responsive_web/screen/portfolio/portfolio_screen.dart';
import 'package:flutter_responsive_web/screen/portfolio_detail/portfolio_detail_screen.dart';
import 'package:flutter_responsive_web/screen/question/question_screen.dart';
import 'package:flutter_responsive_web/screen/recurit/recruit_screen.dart';
import 'package:flutter_responsive_web/util/custom_scroll_behavior.dart';
import 'package:flutter_responsive_web/util/my_color.dart';
import 'package:flutter_responsive_web/util/text_util.dart';
import 'package:flutter_responsive_web/widgets/custom_constraints.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
    initialPath: RoutePage.company,
    notFoundRedirectNamed: RoutePage.company,
    locationBuilder: RoutesLocationBuilder(
      routes: {
        RoutePage.company: (context, state, data) {
          return const BeamPage(
              key: ValueKey("company"),
              title: "Company",
              child: CompanyScreen());
        },
        RoutePage.portfolio: (context, state, data) {
          return const BeamPage(
              key: ValueKey("portfolio"),
              title: "Portfolio",
              child: PortfolioScreen());
        },
        RoutePage.recruit: (context, state, data) {
          return const BeamPage(
              key: ValueKey("recruit"),
              title: "Recruit",
              child: RecruitScreen());
        },
        RoutePage.question: (context, state, data) {
          return const BeamPage(
              key: ValueKey("question"),
              title: "Question",
              child: QuestionScreen());
        },
        RoutePage.portfolioDetail: (context, state, data) {
          return const BeamPage(
              key: ValueKey("portfolioDetail"),
              title: "PortfolioDetail",
              child: PortfolioDetailScreen());
        },
      },
    ).call,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Homepage",
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      builder: (context, child) {
        return CustomConstraints(
            backgroundColor: Colors.white, maxWidth: 1920, child: child!);
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade600),
        useMaterial3: true,
        fontFamily: "pretendard",
        textTheme: TextUtil.setTextTheme(),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.disabled)) return Colors.grey;
              return null;
            },
          ), backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.grey;
              }
              return MyColor.blue40;
            },
          )),
        ),
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}
