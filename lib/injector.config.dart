// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/feed/data/local_data_source/local_data_source.dart' as _i3;
import 'features/feed/data/repo_impl.dart' as _i5;
import 'features/feed/domain/repo/feed_repo.dart' as _i4;
import 'features/feed/domain/use_cases/get_feed_use_case.dart' as _i6;
import 'features/feed/presentation/cubit/feed_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.LocalDataSource>(() => _i3.LocalDataSource());
  gh.factory<_i4.FeedRepo>(() => _i5.FeedRepoImpl(get<_i3.LocalDataSource>()));
  gh.factory<_i6.GetFeedUseCase>(() => _i6.GetFeedUseCase(get<_i4.FeedRepo>()));
  gh.factory<_i7.FeedCubit>(() => _i7.FeedCubit(get<_i6.GetFeedUseCase>()));
  return get;
}
