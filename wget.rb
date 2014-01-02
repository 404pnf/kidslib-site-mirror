require 'FileUtils'

# 下载首页和分类页面的所有链接
def mirror_kidslib
  site = 'http://ilearning.cn/ebooklist/category/'
  zaojiao = [5].product([1, 2], [6, 7, 8, 9, 10]).map(&:flatten)
  dushuwu = [12].product([1, 2, 3, 4], [11, 13, 14, 41, 42]).map(&:flatten)
  xiaoketang = [16].product([2, 3, 4], [43, 44, 45]).map(&:flatten)
  more = [5].product([1, 2]) + [12].product([1, 2, 3, 4]) + [16].product([2, 3, 4])
  all_urls = (zaojiao + dushuwu + xiaoketang + more).map { |e| site + e.join('/') + '.html' }
  (all_urls + %w[http://ilearning.cn/index.html]).each do |url|
    p url
    # -N 是已经下载过的就不再下载了
    # 使用了 -N 就不要用 -nc 了 因为 -N 是优先
    # -k 是把 http://ilearning.cn 这种链接改为相对的 '../../'
    system("wget -E -N -k  -nc -p #{url}") # 有 -p 下载显示完整页面所有资源 , 有 -nc 因此不会重复下载css，图片等模版资源
  end
end

def remove_prev
  FileUtils.rm_r 'ilearning.cn', verbose: true, force: true
end

def copy_to_dest
  FileUtils.cp_r 'ilearning.cn/.', 'ilearning', verbose: true 
end

remove_prev if File.exists? 'ilearning.cn'
mirror_kidslib
copy_to_dest
