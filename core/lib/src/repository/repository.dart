/// This is a repository layer which will act as a layer between the bloc and
/// the data. The bloc will connect to the repository and in repository we will
/// decide from where to get the data. Either from local repository or from the
/// remote repository. The bloc will not know from where the data has been
/// updated or ot got the data.
export 'local_repository/local_repositoy.dart';
