package org.Hooya.thread;

import org.springframework.stereotype.Component;

import java.util.concurrent.*;

@Component
public class InvoiceThreadPool {
    public static final int corePoolSize = 10;
    static final int maximumPoolSize = 20;
    static final long keepAliveTime = 5;
    static final TimeUnit unit = TimeUnit.SECONDS;
    static final BlockingQueue<Runnable> workQueue = new LinkedBlockingQueue<>();
    static final ThreadFactory threadFactory = Executors.defaultThreadFactory();
    public static final ThreadPoolExecutor executor = new ThreadPoolExecutor(corePoolSize, maximumPoolSize, keepAliveTime, unit,
            workQueue, threadFactory);
}
