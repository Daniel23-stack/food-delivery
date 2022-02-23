import 'package:foodie_delivery_boy/data/models/earning.dart';
import 'package:foodie_delivery_boy/data/repositories/earning.repository.dart';
import 'package:stacked/stacked.dart';

class EarningViewModel extends BaseViewModel {
  //
  EarningRepository earningRepository = EarningRepository();
  //
  Earning earning = Earning();

  //
  fetchEarning() async {
    setBusy(true);
    try {
      earning = await earningRepository.getMyEarning();
      clearErrors();
    } catch (error) {
      setError(error);
    }
    setBusy(false);
  }
}
