import 'package:get/get.dart';
import 'package:izzat/app/modules/home/home_services.dart';
import 'package:izzat/app/modules/home/models/response_carousel.dart';
import 'package:izzat/app/modules/models/api_return_value.dart';

class HomeController extends GetxController {
  RxInt? codeCarousel = 0.obs;
  List<ResponseCarousel>? listCarousel;
  //TODO: Implement HomeController
  Future getCarousel() async {
    ApiReturnValue _result = await HomeServices().getCaraousel();
    var stCode = _result.code;
    // print('controller :${result.value}');
    print('controller : ${_result.value}');
    switch (stCode) {
      case 200:
        codeCarousel?.value = stCode!;
        listCarousel = _result.value;
        print('masuk 200 :${_result.value.length}');
        break;
      default:
        codeCarousel!.value = stCode!;
        listCarousel = _result.value;
    }
  }

  Future<void> getDataHome() async {
    await getCarousel();
    print('beres semua');
  }
}
