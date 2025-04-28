# problem: Leetcode 1436. 旅行终点站
# 给你一份旅游线路图，图上标明了所有可能的旅行线路，请你找出旅行终点站。
# 输入: paths = [["London", "New York"], ["New York", "Lima"], ["Lima", "Sao Paulo"]]
# 输出: "Sao Paulo"
# 解释: 从 "London" 出发，最后抵达终点站 "Sao Paulo" 。
# link: https://leetcode.cn/problems/destination-city/

# @param {String[][]} paths
# @return {String}
def dest_city(paths)
  res = {}
  paths.each { |path| res[path[0]] = path[1] }
  res.each_value { |n| return n if res[n].nil? }
end

paths = [['London', 'New York'], ['New York', 'Lima'], ['Lima', 'Sao Paulo']]
p dest_city paths
