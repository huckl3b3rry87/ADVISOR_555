/*
 *
 *   --- THIS FILE GENERATED BY S-FUNCTION BUILDER: BASIC, 1.0 ---
 *
 *   This file is a wrapper S-function produced by the S-Function
 *   Builder which only recognizes certain fields.  Changes made
 *   outside these fields will be lost the next time the block is
 *   used to load, edit, and resave this file. This file will be overwritten
 *   by the S-function Builder block. If you want to edit this file by hand, 
 *   you must change it only in the area defined as:  
 *
 *        %%%-SFUNWIZ_wrapper_XXXXX_Changes_BEGIN 
 *            Your Changes go here
 *        %%%-SFUNWIZ_wrapper_XXXXXX_Changes_END
 *
 *   For better compatibility with the Real-Time Workshop, the
 *   "wrapper" S-function technique is used.  This is discussed
 *   in the Real-Time Workshop User's Manual in the Chapter titled,
 *   "Wrapper S-functions".
 *
 *   Created: Tue Apr  9 11:40:32 2002
 */
/*
 * Include Files
 *
 */
#include "tmwtypes.h"
/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include "cumminsCOfunc.c"
#include "cumminsCO2func.c"
#include "cumminsNOxfunc.c"
#include "navistarCOfunc.c"
#include "navistarCO2func.c"
#include "navistarNOxfunc.c"
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
void sfunNNemis_Outputs_wrapper(const real_T *u,
                             real_T       *y,      
                              const real_T  *param0, const int_T p_width0)
{
  /* This Outputs function allows for 1 input and 1 output
   * signal of any width, any number of discrete states and 
   * parameters, all of type real_T.  
   *
   * If you need the FULL POWER of the S-function interface, 
   * familiarize yourself with the full template file at:
   * 
   *     matlabroot/simulink/src/sfuntmpl_doc.c
   *
   * and the "Writing S-functions" manual in the documentation.
   */
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
    double tempout=0.0;
	double tempin[6];

    /* 	param0[0] == 0, Cummins ISM 370 select 
	param0[0] == 1, Navistar T 444E select

	y[0] is CO  in g/s
	y[1] is CO2 in g/s
	y[2] is NOx in g/s

	u[0] is engine shaft [S] speed in rpm
	u[1] is dS/dt taken at 05 seconds
	u[2] is dS/dt taken at 10 seconds
	u[3] is brake torque [T] in Nm
	u[4] is dT/dt taken at 05 seconds
	u[5] is dT/dt taken at 10 seconds 
    */

    if(param0[0]==0)
    {	/* Cummins ISM 370 */
		/* tempin is required because input array gets changed in the function call */
		tempin[0]=u[0];
		tempin[1]=u[1];
		tempin[2]=u[2];
		tempin[3]=u[3];
		tempin[4]=u[4];
		tempin[5]=u[5];
		cumminsCOfunc(tempin,&tempout);
		y[0]=tempout;
		
		/* reinitialize with u... */
		tempin[0]=u[0];
		tempin[1]=u[1];
		tempin[2]=u[2];
		tempin[3]=u[3];
		tempin[4]=u[4];
		tempin[5]=u[5];
		cumminsCO2func(tempin,&tempout);
		y[1]=tempout;
		
		/* reinitialize with u... */
		tempin[0]=u[0];
		tempin[1]=u[1];
		tempin[2]=u[2];
		tempin[3]=u[3];
		tempin[4]=u[4];
		tempin[5]=u[5];
		cumminsNOxfunc(tempin,&tempout);
		y[2]=tempout;
    }
    else if(param0[0]==1)
    {   /* Navistar T444 E */
		/* tempin is required because input array gets changed in the function call */
		tempin[0]=u[0];
		tempin[1]=u[1];
		tempin[2]=u[2];
		tempin[3]=u[3];
		tempin[4]=u[4];
		tempin[5]=u[5];    
		navistarCOfunc(tempin, &tempout);
		y[0]=tempout;
		
		/* reinitialize with u... */
		tempin[0]=u[0];
		tempin[1]=u[1];
		tempin[2]=u[2];
		tempin[3]=u[3];
		tempin[4]=u[4];
		tempin[5]=u[5];
		navistarCO2func(tempin, &tempout);
		y[1]=tempout;

		/* reinitialize with u... */
		tempin[0]=u[0];
		tempin[1]=u[1];
		tempin[2]=u[2];
		tempin[3]=u[3];
		tempin[4]=u[4];
		tempin[5]=u[5];		
		navistarNOxfunc(tempin, &tempout);
		y[2]=tempout;
    }
    else
    {	/* send out an "error code" */
		y[0]=-1000.0;
		y[1]=-1000.0;
		y[2]=-1000.0;
 	}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Updates function
 *
 */
void sfunNNemis_Update_wrapper(const real_T *u,
                             const real_T *y, 
                              const real_T  *param0, const int_T p_width0)
{
/* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
/*
 * Code example
 *   xD[0] = u[0];
 */  
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 *  Derivatives function
 *
 */
void sfunNNemis_Derivatives_wrapper(const real_T *u,
                             const real_T *y, real_T *dx, 
                              const real_T  *param0, const int_T p_width0)
{
/* %%%-SFUNWIZ_wrapper_Derivatives_Changes_BEGIN --- EDIT HERE TO _END */
/*
 * Code example
 *   dx[0] = xC[0];
 */  
/* %%%-SFUNWIZ_wrapper_Derivatives_Changes_END --- EDIT HERE TO _BEGIN */
}





