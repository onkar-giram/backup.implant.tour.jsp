/**
 * 
 */
package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.demo.bean.DemoBean;
import com.demo.db.ConnectionProvider;

/**
 * @author IT development
 *
 */
public class DemoDao {
		
//FOR VIEW_RECORDS TO FETCH TOUR_DETAILS
			public static ResultSet fetchTourMaster(String fDate , String tDate){
				ResultSet rs=null;
				try{

					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select td.emp_id, td.from_date, td.to_date, td.reason, vm.vehicle_no, vm.vehicle_name, vrm.rate, td.km from vehicle_mst vm, vehicle_rate_mst vrm, tour_details td where vm.vehicle_id = vrm.vehicle_id and vm.vehicle_id = td.vehicle_id and td.from_date between ? and ?");
					pst.setString(1, fDate);
					pst.setString(2, tDate);
					rs = pst.executeQuery();

				}
				catch(Exception ex)
				{System.out.println(ex.toString());}
				return rs;
			}		
						
			
		
// For Tour  Details
			
	//INSERT
			public static int insertTourDetails(DemoBean obj){
				int prog=0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("insert into tour_details values(?,?,?,?,?,?,?,?,?,?,?)");
					pst.setInt(1,obj.getEmpId()); 
					pst.setString (2, obj.getFromDate());
					pst.setString(3, obj.getToDate());
					pst.setString(4, obj.getAlongWith());
					pst.setString(5, obj.getReason());
					pst.setInt(6, obj.getVehicleId());
					pst.setString(7, obj.getBillNo());
					pst.setFloat(8, obj.getKm());
					pst.setInt(9, obj.getRegBy());
					pst.setString(10, obj.getRegDateTime());
					pst.setInt(11, obj.getRegStatus());
					
					prog = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return prog;
			}
	//UPDATE
			public static int updateTourDetails(DemoBean obj){
				int progress = 0;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("update tour_details SET emp_id=?,from_date=?,to_date=?,along_with=?,reason=?,vehicle_id=?,bill_no=?,km=?,reg_by=?,reg_date_time=?, reg_status=? where id=?");
					pst.setInt(1,obj.getEmpId()); 
					pst.setString (2, obj.getFromDate());
					pst.setString(3, obj.getToDate());
					pst.setString(4, obj.getAlongWith());
					pst.setString(5, obj.getReason());
					pst.setInt(6, obj.getVehicleId());
					pst.setString(7, obj.getBillNo());
					pst.setFloat(8, obj.getKm());
					pst.setInt(9, obj.getRegBy());
					pst.setString(10, obj.getRegDateTime());
					pst.setInt(11, obj.getRegStatus());
					pst.setInt(12, obj.getId());
					 
					progress = pst.executeUpdate();
				}
				catch(Exception ex){
					System.out.println(ex.toString());
				}
				return progress;
			}
	//FETCH
			public static ResultSet fetchTourDetails(){
				ResultSet rs=null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select * from tour_details");
					
					rs = pst.executeQuery();

				}
				catch(Exception ex)
				{System.out.println(ex.toString());}
				return rs;
			}		

//FOR VEHICLE MASTER
	
//FETCH
			public static ResultSet fetchVehicleMaster(){
				ResultSet rs=null;
				try{
					Connection con = ConnectionProvider.getConnection();
					PreparedStatement pst = con.prepareStatement("select * from vehicle_mst");
					rs = pst.executeQuery();

				}
				catch(Exception ex)
				{System.out.println(ex.toString());}
				return rs;
			}		


			
//VOID MAIN	
//VOID MAIN
															
			public static void main(String args[]){
				DemoBean obj = new DemoBean();
			}
		}
