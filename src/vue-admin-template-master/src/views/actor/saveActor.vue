<template>
  <div class="app-container">
    <!-- 演员表单 -->
    <el-form  label-width="80px">
        <el-form-item label="演员名称">
            <el-input v-model="actor.name"></el-input>
        </el-form-item>
        <el-form-item label="演员排序">
            <el-input v-model="actor.sort"></el-input>
        </el-form-item>
        <el-form-item label="演员头衔">
            <el-input v-model="actor.level"></el-input>
        </el-form-item>
        <el-form-item label="演员简介">
            <el-input v-model="actor.intro"></el-input>
        </el-form-item>
        <el-form-item label="演员资历">
            <el-input v-model="actor.career"></el-input>
        </el-form-item>
        <!-- 演员头像 -->
        <el-form-item >
             <el-button :disabled="saveBtnDisabled" type="primary" @click="saveOrUpdate">保 存</el-button>
             <el-button :disabled="saveBtnDisabled" type="default" @click="resetActor">清 空</el-button>
        </el-form-item>
    </el-form>
  </div>
</template>

<script>
//引入调用演员的js
import actorFun from "@/api/movies/actor.js";
export default {
    data(){
        return{
            actor:{},
            saveBtnDisabled: false
        }
    },
    created(){
        this.init()
    },
    watch:{//监听路由的变化
       $route(to,from){
          this.init()  
       }

    },
    methods:{
        //初始化方法
        init(){
            if(this.$route.params && this.$route.params.id){
                const id = this.$route.params.id
                //调用获取演员的方法
                this.getInfo(id)
            }
        },
        //保存或更新
        saveOrUpdate(){
            //根据演员的id判断是否为保存或更新
            if(this.actor.id){
                this.update()    
            }else{
                this.save()
            }
        },
        //保存
        save(){
            actorFun.saveActor(this.actor).then((result) => {
                this.$message({
                    type: 'success',
                    message: '保存成功'
                })
                //显示列表,通过路由的路径显示演员列表
                this.$router.push({path:'/actor/list'})
            }).catch((err) => {
                
            });
        },
        //更新
        update(){
            actorFun.updateActor(this.actor).then(res=>{
                this.$message({
                    type: 'success',
                    message: '更新成功'
                })
                //返回到演员列表
                this.$router.push({path:'/actor/list'})
            })
        },
        getInfo(id){
            actorFun.findById(id).then(res=>{
                this.actor = res.data.actor
            })
        },
        //清空
        resetActor(){
            this.actor = {}
        }
    }

}
</script>

<style>

</style>