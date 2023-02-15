import 'package:get/get.dart';
import 'package:izzat/app/modules/home/home_services.dart';
import 'package:izzat/app/modules/home/models/response_carousel.dart';
import 'package:izzat/app/modules/home/models/response_product_card.dart';
import 'package:izzat/app/modules/models/api_return_value.dart';

class HomeController extends GetxController {
  RxInt? codeCarousel = 0.obs;
  RxInt? codePopularProduct = 0.obs;
  RxString? messageCarousel;
  RxString? messagePopularProduct;
  List<ResponseCarousel>? listCarousel;
  List<ResponseProductCard>? listPopularProduct;
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
        messageCarousel = _result.value;
    }
  }

  Future getPopularProduct() async {
    ApiReturnValue _resultPopular = await HomeServices().getPopularProduct();
    var stCode = _resultPopular.code;
    // print('controller :${result.value}');
    print('controller popular: ${_resultPopular.value}');
    switch (stCode) {
      case 200:
        codePopularProduct?.value = stCode!;
        listPopularProduct = _resultPopular.value;
        print('masuk 200 popular:${_resultPopular.value.length}');
        break;
      default:
        codePopularProduct!.value = stCode!;
        listCarousel = _resultPopular.value;
    }
  }

  Future<void> getDataHome() async {
    await getCarousel();
    await getPopularProduct();
    print('beres semua');
  }
}
