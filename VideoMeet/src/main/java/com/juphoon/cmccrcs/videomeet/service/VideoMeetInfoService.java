package com.juphoon.cmccrcs.videomeet.service;

import com.github.pagehelper.PageInfo;
import com.juphoon.cmccrcs.videomeet.entity.VideoMeetInfo;
import com.juphoon.cmccrcs.videomeet.entity.VideoMeetInfoVO;

import java.util.List;

/**
 * Created by Administrator on 2017/5/28 0028.
 */
public interface VideoMeetInfoService {

    public PageInfo<VideoMeetInfo> selectSendVideoMeetInfoList(String phone, int offset, int limit);
    public PageInfo<VideoMeetInfoVO> selectRecvVideoMeetInfoList(String phone, int offset, int limit);

    public VideoMeetInfo selectOneByMeetId(int meetId);

    public int saveVideoMeetInfo(VideoMeetInfo info);




    public int updateVideoMeetInfo(VideoMeetInfo info);

}
