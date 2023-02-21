# 批量修改视频文件的 md5

## 简介

批量修改视频文件的 md5 哈希，可简单用于上传网盘防审查和谐。

[modify-file-hash](https://github.com/tisfeng/modify-file-hash) 是该项目的一个 `Raycast` 扩展版本，除了修改文件哈希，还支持对文件进行 zip 加密压缩和提取，使用更方便，推荐使用。

## 缘起

在把一些电影上传到阿里云盘做备份时，发现也会被和谐，尤其各类小电影更是频频遭重，很烦。穷则思变，推测这类网络审查的原理之一是检测视频文件的 md5 或 sha1 哈希值，于是就有了通过修改视频 md5 来骗过审查的想法。(另一种方式是将视频加密压缩，麻烦但也更可靠)

之前没接触过脚本，临时去学了一下 [Bash 脚本教程](https://wangdoc.com/bash/intro.html)，然后在谷歌和 `GitHub Copilot` 的帮助下编写了人生第一个 shell 脚本。

![](https://tva1.sinaimg.cn/large/e6c9d24egy1h1ioyvdjpbj21c00u040d.jpg)

## 使用

**把 `modify_videos_md5.sh` 脚本放到视频文件所在的目录下，然后 `终端` 进入该目录，执行以下脚本，即可修改目录下所有视频文件的 md5。 另外，该脚本可多次使用，且每次执行都会修改所有视频文件的 md5。**

```bash
# 在视频文件所在的目录下运行
bash modify_videos_md5.sh
```

![](https://tva1.sinaimg.cn/large/e6c9d24egy1h1iv9r7db9j21ac0u0n13.jpg)

PS：由于一些网盘具有秒传功能，这个的实现也是靠比对文件哈希值，因此建议只修改可能会被审查和谐的视频文件，其他学习资料就不要多此一举了。。

（其中 `restore_videos_md5.sh` 用于恢复当前目录下所有文件的 md5，需与 `modify_videos_md5.sh` 搭配使用。）



## 后续 😅

额，最近阿里云盘的审查技术似乎升级了，突然账号就被封了。。。阿里不讲武德，不是和谐视频，竟直接封号，这样谁还敢把资料放你云盘上？莫名其妙哪一天账号就没了，谁还敢跟你玩。 另外看了一下，同样的一份视频在百度网盘还好好的 😓。

总之，不推荐使用这种简单方式抵抗审查了，非要用的话，还是加密压缩吧。或直接上 NAS，一劳永逸。

![image-20221024110433492](https://raw.githubusercontent.com/tisfeng/ImageBed/main/uPic/image-20221024110433492-1666580673.png)

## 原理

核心代码其实就一行，在文件末尾追加字符：

```bash
# 将字符串追加到文件末尾，例如 echo 'a' >> video.mp4
echo -n "#1024" >> $file
```



## 参考

[如何改变一段视频文件的MD5? - Yang的回答 - 知乎](https://www.zhihu.com/question/25378331/answer/80903615)