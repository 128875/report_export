package org.Hooya.util;

import org.Hooya.entity.ErrorLog;
import org.Hooya.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class AsyncTask {
    @Autowired
    private LogService logService;

    @Async
    public void saveErrorLog(ErrorLog errorLog)
    {
        logService.save(errorLog);
    }
}
