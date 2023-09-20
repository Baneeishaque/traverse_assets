import 'dart:io';

void traverseAssetsFolder() {
  final rootFolder = Directory(r'C:\Lab\upload_products\assets');
  final List<FileSystemEntity> rootFolderContents =
      rootFolder.listSync().toList();
  // rootFolderContents.forEach(print);

  for (final categoryFolder in rootFolderContents) {
    // print("Category : ${categoryFolder.path}");
    if ((FileSystemEntity.typeSync(categoryFolder.path)) ==
        FileSystemEntityType.directory) {
      final List<FileSystemEntity> categoryFolderContents =
          (Directory(categoryFolder.path)).listSync().toList();
      for (var productFolder in categoryFolderContents) {
        // print("Product : ${productFolder.path}");
        final List<FileSystemEntity> productFolderContents =
            (Directory(productFolder.path)).listSync().toList();

        for (var productFolderContent in productFolderContents) {
          if ((FileSystemEntity.typeSync(productFolderContent.path)) ==
              FileSystemEntityType.directory) {
            for (var image in ((Directory(productFolderContent.path))
                .listSync()
                .toList())) {
              // print("Product Image: ${image.path}");
              print(
                  '    - ${image.path.replaceFirst(r'C:\Lab\upload_products\', '')}');
            }
          } else {
            // print("Product JSON : ${productFolderContent.path}");
            print(
                '    - ${productFolderContent.path.replaceFirst(r'C:\Lab\upload_products\', '')}');
          }
        }
      }
    } else {
      print("Invalid Structure");
    }
  }
}
