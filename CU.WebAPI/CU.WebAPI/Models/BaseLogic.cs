﻿using System;

namespace CU.WebAPI.Models
{
    public class BaseLogic : IDisposable
    {
        /// <summary>
        /// 
        /// </summary>
        private BaseLogic context = null;

        /// <summary>
        ///  Constructor
        /// </summary>
        public BaseLogic()
        {
            this.context = this;
        }

        /// <summary>
        /// NOTE: Leave out the finalize altogether if this class doesn't 
        /// own unmanaged resources itself, but leave the other methods
        /// exactly as they are. 
        /// </summary>
        ~BaseLogic()
        {
            Dispose(false);
        }

        /// <summary>
        ///
        /// </summary>
        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// The bulk of the clean-up code is implemented in Dispose(bool) 
        /// </summary>
        /// <param name="disposing">true/false</param>
        private void Dispose(bool disposing)
        {
            if (disposing)
            {
                // free managed resources
                if (context != null)
                {
                    this.context = null;
                }
            }
        }
    }
}