var m, sanitize_oneline;

m = angular.module('u', ['ngSanitize']);

m.controller('u_ctrl', function($scope) {
  $scope.elem_owner_id = 'ignat_insarov';
  $scope.go = function() {
    return VK.Api.call('users.get', {
      'user_ids': sanitize_oneline($scope.elem_owner_id)
    }, function(r) {
      return VK.Api.call('wall.get', {
        'owner_id': r.response[0].uid
      }, function(r) {
        $scope.posts = r.response.slice(1);
        return $scope.$apply();
      });
    });
  };
  VK.init({
    'apiId': 5035099
  });
  return $scope.go();
});

m.directive("contenteditable", function() {
  return {
    restrict: "A",
    require: "ngModel",
    link: function(scope, element, attrs, ngModel) {
      var read;
      read = function() {
        return ngModel.$setViewValue(element.html());
      };
      ngModel.$render = function() {
        return element.html(ngModel.$viewValue || "");
      };
      return element.bind("blur keyup change", function() {
        return scope.$apply(read);
      });
    }
  };
});

sanitize_oneline = function(input) {
  return input.split('<br>', 1);
};
