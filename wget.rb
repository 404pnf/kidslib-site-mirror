require 'FileUtils'

# 下载首页和分类页面的所有链接
def mirror_kidslib
  site = 'http://kidslib.fltrp.com/ebooklist/category/'
  zaojiao = [5].product([1, 2], [6, 7, 8, 9, 10]).map(&:flatten)
  dushuwu = [12].product([1, 2, 3, 4], [11, 13, 14, 41, 42]).map(&:flatten)
  xiaoketang = [16].product([2, 3, 4], [43, 44, 45]).map(&:flatten)
  more = [5].product([1, 2]) + [12].product([1, 2, 3, 4]) + [16].product([2, 3, 4])
  all_urls = (zaojiao + dushuwu + xiaoketang + more).map { |e| site + e.join('/') + '' }
  (all_urls + %w[http://kidslib.fltrp.com/]).each do |url|
    p url
    # --convert-links -r
    system("wget --convert-links  -E -N -nc -k -p #{url} -o wget.log" ) # 有 -p 下载显示完整页面所有资源 , 有 -nc 因此不会重复下载css，图片等模版资源
  end
end

def remove_prev
  FileUtils.rm_r 'kidslib.fltrp.com', verbose: true, force: true
end

def copy_to_dest
  FileUtils.cp_r 'kidslib.fltrp.com', 'ilearning', verbose: true
end

remove_prev if File.exist? 'kidslib.fltrp.com'
mirror_kidslib
#copy_to_dest
