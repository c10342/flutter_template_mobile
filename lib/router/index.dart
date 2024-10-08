import 'package:flutter/material.dart';
import 'package:flutter_template/pages/home/index.dart';
import 'package:flutter_template/pages/login/index.dart';
import 'package:flutter_template/router/route_manage.dart';
import 'package:go_router/go_router.dart';

//获取全局 context
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//监听路由变化
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

//页面路由
final GoRouter router = GoRouter(
  initialLocation: '/',
  // 获取全局 context
  navigatorKey: navigatorKey,
  // 监听路由变化
  observers: [routeObserver],
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: RouteManage.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          name: RouteManage.home,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
    ),
  ],
);
