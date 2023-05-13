import '../bloc/short/short_bloc.dart';
import '../data/repository/short_repository.dart';
import '../data/models/short.dart';
import '../utils/custom_error.dart';

class ShortViewModel {
  final ShortBloc _shortBloc;
  final ShortRepository _shortRepository;

  ShortViewModel({
    required ShortBloc shortBloc,
    required ShortRepository shortRepository,
  })  : _shortBloc = shortBloc,
        _shortRepository = shortRepository;

  Future<void> init() async {
    try {
      List<Short> list = await _shortRepository.init();
      _shortBloc.add(ShortInitEvent(list: list));
    } catch (err) {
      throw ViewModelError(message: 'shortViewModel.init()');
    }
  }

  Future<void> next() async {
    try {
      Short next = await _shortRepository.get();
      _shortBloc.add(ShortNextEvent(next: next));
    } catch (err) {
      throw ViewModelError(message: 'ShortViewModel.next()');
    }
  }
}
