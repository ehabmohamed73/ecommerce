import 'package:ecommerceapp/applinks.dart';
import 'package:ecommerceapp/core/classes/crud.dart';

class FavoriteData {
  Crud curd;
  FavoriteData(this.curd);

  addFavorite(String favUserId, String favItemId) async {
    var respons = await curd.postData(AppLinks.addFavorite,
        {"favorite_userid": favUserId, "favorite_itemid": favItemId});
    return respons.fold((l) => l, (r) => r);
  }

  removeFavorite(String favUserId, String favItemId) async {
    var respons = await curd.postData(AppLinks.removeFavorite,
        {"favorite_userid": favUserId, "favorite_itemid": favItemId});
    return respons.fold((l) => l, (r) => r);
  }

  removeFromFavorite(String favId) async {
    var respons =
        await curd.postData(AppLinks.deletefromFav, {"favorite_id": favId});
    return respons.fold((l) => l, (r) => r);
  }

  viewFavorite(String favUserId) async {
    var respons = await curd
        .postData(AppLinks.showFavorite, {"favorite_userid": favUserId});
    return respons.fold((l) => l, (r) => r);
  }
}
