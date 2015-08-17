angular.module('u', ['ngSanitize']).controller('u_ctrl', function($scope) {
  $scope.random = [1, 2, 3];
  VK.init({
    'apiId': 5035099
  });
  return VK.Api.call('wall.get', {
    'owner_id': 1
  }, function(r) {
    $scope.posts = r.response;
    return $scope.$apply();
  });
});
