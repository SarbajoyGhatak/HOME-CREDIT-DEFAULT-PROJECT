import gdown
import os
import schedule
import time



FOLDER_URL = "https://drive.google.com/drive/folders/1zDe8xyofOJmcAw8EBl8YfaltQSvDandw"
DOWNLOAD_PATH = "HOME-CREDIT-RISK-AUTOMATION/data/raw"



def download_all_files():

    os.makedirs(DOWNLOAD_PATH, exist_ok=True)

    print("Starting download from Google Drive...")

    gdown.download_folder(
        url=FOLDER_URL,
        output=DOWNLOAD_PATH,
        quiet=False,
        use_cookies=False
    )

    print("Download completed.")




if __name__ == "__main__":

    # Run immediately once
    download_all_files()

   # schedule.every(10).hours.do(download_all_files)

   # print("Scheduler started. Pipeline will run every 10 hours.")

    #while True:
        #schedule.run_pending()
        #time.sleep(60)