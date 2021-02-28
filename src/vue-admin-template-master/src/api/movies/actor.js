import request from '@/utils/request'

export default  {
    //显示演员列表
    getPageList(page, limit,actorQuery){
        return request({
        url: `/edu-actor/${page}/${limit}`,
        method: 'post',
        data: actorQuery
        })
    },
    //根据id删除演员
    deleteActor(id){
        return request({            
             url: `/edu-actor/del/${id}`,
             method: 'delete'
        })
    },
    //保存演员信息
    saveActor(actor){
        return request({            
            url: `/edu-actor/save`,
            method: 'post',
            data: actor
       })
    },
    //获取更新对象
    findById(id){
        return request({            
            url: `/edu-actor/data/${id}`,
            method: 'get'
       })  
    },
    //更新对象
    updateActor(actor){
        return request({            
            url: `/edu-actor/update`,
            method: 'put',
            data: actor
       })
    }
  }