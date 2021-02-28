<template>
  <div class="app-container">
    <!-- 演员查询表单 -->
    <el-form :inline="true" class="demo-form-inline">
      <el-form-item label="演员名称">
        <el-input v-model="actorQuery.name" placeholder="演员名称"></el-input>
      </el-form-item>
      <el-form-item label="演员头衔">
        <el-select v-model="actorQuery.level" placeholder="演员头衔">
          <el-option label="一线演员" :value="1"></el-option>
          <el-option label="二线演员" :value="2"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="添加时间">
        <el-date-picker
          v-model="actorQuery.begin"
          type="datetime"
          placeholder="选择开始日期时间"
          value-format="yyyy-MM-dd HH:mm:ss"
          default-time="00:00:00"
        />
      </el-form-item>
      <el-form-item label="添加时间">
        <el-date-picker
          v-model="actorQuery.end"
          type="datetime"
          placeholder="选择结束日期时间"
          value-format="yyyy-MM-dd HH:mm:ss"
          default-time="00:00:00"
        />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="getList()">查 询</el-button>
        <el-button type="default" @click="resetData()">清 空</el-button>
      </el-form-item>
    </el-form>

    <!-- 演员列表的表格 -->
    <el-table :data="list" style="width: 100%">
      <el-table-column label="序号">
         <template slot-scope="scope">
            {{(page-1)*limit+scope.$index+1}}    
         </template>    
       </el-table-column>
      <el-table-column label="演员名称" prop="name"> </el-table-column>      
      <el-table-column label="演员头衔">
         <template slot-scope="scope">
            {{scope.row.level===1?'一线演员':'二线演员'}}
         </template>     
      </el-table-column>      
      <el-table-column label="演员介绍" prop="intro"> </el-table-column>      
      <el-table-column label="演员入职日期" prop="gmtCreate"> </el-table-column>   
      <el-table-column>   
        <template slot-scope="scope">
          <router-link :to="'/actor/edit/'+scope.row.id">
                <el-button size="mini">更 新</el-button >
          </router-link>
          <el-button size="mini" type="danger"  @click="handleDelete(scope.row.id)">刪 除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页按钮 -->
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="getList"
      :current-page="page"
      :page-sizes="[3,5,7]"
      :page-size="limit"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total">
    </el-pagination>
  </div>
</template>

<script>
//引入调用演员的js
import actor from "@/api/movies/actor.js";

export default {
  //编写核心代码
  data() {
    return {
      list: null,
      page: 1,
      limit: 3,
      total: 0,
      actorQuery: {         
      },
    };
  },
  created() {
      this.getList()
  },
  methods: {
    //查询方法
    getList(page=1) {
        this.page = page
        //调用自定义函数
        actor.getPageList(this.page,this.limit,this.actorQuery).then((result) => {//请求成功
            this.list = result.data.items
            this.total = result.data.total
        }).catch((err) => {
            
        });
    },
    handleSizeChange(size){
        this.limit = size
        this.getList()
    },
    //清空方法
    resetData() {
      this.actorQuery = {};
    },
    //删除
    handleDelete(id){
        this.$confirm('是否删除?','提示',{
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
        }).then(res=>{
            actor.deleteActor(id).then(res=>{
                this.$message({
                    type: 'success',
                    message: '删除成功'
                })
                //调用演员的列表方法
                this.getList()
            })
        })
    }
  },
};
</script>

<style>
</style>