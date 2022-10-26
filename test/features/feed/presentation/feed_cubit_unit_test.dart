import 'package:bloc_test/bloc_test.dart';
import 'package:caw_studio/features/feed/presentation/cubit/feed_cubit.dart';
import 'package:caw_studio/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FeedCubit feedCubit;

  setUpAll(() {
    configureDependencies();
    feedCubit = getIt<FeedCubit>();
  });

  test("test_initial_state", () {
    testBloc(build: () => feedCubit, expect: () => []);
  });

  test("check_if_data_fetched_successfully", () async {
    testBloc(
        build: () => feedCubit,
        act: (cubit) async {
          await cubit.fetchData();
        },
        expect: () => [isA<FeedLoading>(), isA<FeedSuccess>()]);
  });
}
