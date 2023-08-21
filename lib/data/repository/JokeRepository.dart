import '../data_source/JokeRemoteDataSource.dart';

class JokeRepository {
  final JokeRemoteDataSource remoteDataSource;

  JokeRepository(this.remoteDataSource);

  Future<String> getRandomJoke() async {
    return await remoteDataSource.fetchJoke();
  }
}