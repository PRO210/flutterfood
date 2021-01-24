import '../data/network/repositories/order_repository.dart';
import 'package:mobx/mobx.dart';
part 'orders.store.g.dart';

class OrdersStore = _OrdersStoreBase with _$OrdersStore;

abstract class _OrdersStoreBase with Store {
  OrderRepository _orderRepository = OrderRepository();

  @observable
  bool insMakingOrder = false;

  @action
  Future makeOrder(String tokenCompany, List<Map<String, dynamic>> foods,
      {String comment}) async {
    insMakingOrder = true;
    await _orderRepository.makeOrder(tokenCompany, foods, comment: comment);

    insMakingOrder = false;
  }
}