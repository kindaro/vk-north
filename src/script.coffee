angular.module 'u', ['ngSanitize']
    .controller 'u_ctrl', ($scope) ->
        $scope.random = [1,2,3]
        VK.init 'apiId': 5035099
        VK.Api.call 'wall.get', 'owner_id': 1, (r) ->
            $scope.posts = r.response
            $scope.$apply()
