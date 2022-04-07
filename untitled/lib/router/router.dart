import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/router/router_handler.dart';

class Routes {

   static String root = '/';
   static String detailPage = '/detail';
   static void configureRoutes(FluroRouter router) {
       router.notFoundHandler = new Handler (
          handlerFunc : (BuildContext? context,Map<String,List<String>> params) {
             print('error==>router');
             return;
          }
       );
       router.define(detailPage,handler:detailsHandler);
   }

}